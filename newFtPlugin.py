from pathlib import Path


def ask_yn(prompt: str) -> bool:
    while True:
        answer = input(prompt).strip().lower()
        if answer in ("y", "n"):
            return answer == "y"
        print("Input var ikke y eller n")


filetype = input("Hvilken filtype er språket: ").strip()

fold_enabled = ask_yn("Skal folds være på [y/n]: ")
highlight_enabled = ask_yn("Skal highlighting være på [y/n]: ")
indent_enabled = ask_yn("Skal indentation være på [y/n]: ")

print(f"""
Skriver for filtype {filetype}
Indentation: {'Y' if indent_enabled else 'N'}
Highlighting: {'Y' if highlight_enabled else 'N'}
Folding: {'Y' if fold_enabled else 'N'}
""")

confirm = ask_yn("Stemmer dette, ønsker du å fortsette [y/n]: ")
if not confirm:
    print("Avslutter")
    raise SystemExit(0)

lines = []

if highlight_enabled:
    lines.append("-- highlighting")
    lines.append("pcall(vim.treesitter.start)")
    lines.append("")

if fold_enabled:
    lines.append("-- folds")
    lines.append('vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"')
    lines.append('vim.opt_local.foldmethod = "expr"')
    lines.append("")

if indent_enabled:
    lines.append("-- indent")
    lines.append('vim.bo.indentexpr = "v:lua.require\'nvim-treesitter\'.indentexpr()"')
    lines.append("")

full_config = "\n".join(lines).rstrip() + "\n"

target_dir = Path.home() / ".config/nvim/after/ftplugin"
target_dir.mkdir(parents=True, exist_ok=True)

write_file = target_dir / f"{filetype}.lua"

print(f"Skriver til fil: '{write_file}'")
print("Skriver dette:\n")
print(full_config)

write_file.write_text(full_config, encoding="utf-8")
