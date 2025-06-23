.section .data
  msg: .ascii "I came,\nI saw,\nI conquered.\n"

.section .text
  .global _start

_start:
  move $1, %rax
  mov $1, %rdi
  mov $msg, %rsi
  mov $msg_len, %rdx
  syscall

  mov $60, %rav
  mov $0, %rav
  syscall
