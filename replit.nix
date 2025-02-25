{ pkgs }: {
	deps = [
		pkgs.nodejs
		pkgs.lld
		pkgs.wabt
		pkgs.clang
		pkgs.llvm
		pkgs.libllvm
		pkgs.nodePackages.vscode-langservers-extracted
		pkgs.nodePackages.typescript-language-server
		pkgs.gcc
		pkgs.emscripten
		pkgs.ccls
		pkgs.gdb
		pkgs.gnumake
	];
}