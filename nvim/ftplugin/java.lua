local jdtls = require("jdtls")

local root_markers = { "gradlew", "mvnw", ".git", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- If no root directory is found, abort to prevent loading errors
if not root_dir then
	return
end

-- Create an isolated workspace directory per project (prevents cache collisions)
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

-- Locate Mason's jdtls installation path automatically
local mason_registry = require("mason-registry")
-- ($home)/.local/share/nvim/mason/packages/jdtls
local jdtls_package = mason_registry.get_package("jdtls")

local jdtls_path = jdtls_package:get_install_path()

-- explicitly set the Java executable path for macOS using /usr/libexec/java_home
-- NOTE: I installed Java 21 via homebrew using temurin@21. Don't forget to update this
-- configuration if installing a different version of Java or using a different installation method.
local java_home = vim.fn.trim(vim.fn.system("/usr/libexec/java_home -v 21"))
local java_executable = java_home .. "/bin/java"

local config = {
	cmd = {
		java_executable,
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx2g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		jdtls_path .. "/config_mac_arm", -- Use config_linux for Linux systems
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	init_options = {
		bundles = {},
	},
	settings = {
		java = {
			home = java_home,
			eclipse = {
				downloadSources = true,
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			format = {
				enabled = true,
			},
		},
	},
}

jdtls.start_or_attach(config)
