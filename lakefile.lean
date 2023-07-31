import Lake
open Lake DSL

require cryptolib4 from git 
  "https://github.com/A-Stone-Olguin/cryptolib4"

package «sCL» {
  -- add package configuration options here
}

lean_lib «SCL» {
  -- add library configuration options here
}

@[default_target]
lean_exe «sCL» {
  root := `Main
}
