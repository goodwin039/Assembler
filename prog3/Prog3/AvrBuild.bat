@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "D:\ProjectsGit\Assembler\Prog3\Prog3\labels.tmp" -fI -W+ie -C V2 -o "D:\ProjectsGit\Assembler\Prog3\Prog3\Prog3.hex" -d "D:\ProjectsGit\Assembler\Prog3\Prog3\Prog3.obj" -e "D:\ProjectsGit\Assembler\Prog3\Prog3\Prog3.eep" -m "D:\ProjectsGit\Assembler\Prog3\Prog3\Prog3.map" "D:\ProjectsGit\Assembler\Prog3\Prog3\Prog3.asm"
