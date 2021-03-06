extern __errno_location
section .data
section .bss
section .text
		global ft_write
ft_write:
		push rbp
		mov rbp,rsp

		mov rax, 1
		syscall

		cmp rax, 0
		jl _error
		jmp _return
_error:
		mov r8, rax
		call __errno_location
		neg r8
		mov [rax], r8
		mov rax, -1
		jmp _return
_return:
		mov rsp,rbp
		pop rbp

		ret

;ssize_t write(int fd, const void *buf, size_t count);
;rdi = fd
;rsi = buf
;rdx = count
;
