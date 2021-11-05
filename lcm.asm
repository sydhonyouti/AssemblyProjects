;Program Name:LCM.asm
;Name:Sydney Honyouti
;Program Description:The least common multiple function is going to find the
;least common multiple from two positive integers that the user inputs.
;Function: int lcm (int a, int b) {
	.386
	.model flat, c
	.data
x	dd	?			;int x, y, t, answer;
y	dd	?
t	dd	?
answer	dd	?
	.code
lcm	proc	uses ebx ecx edx esi edi, a:dword, b:dword ;int gcd(int a, int b) {
	mov		eax,a		;x = a;
	mov		x,eax
	
	mov		eax,b		;y = b;
	mov		y,eax
	
	mov		eax,x		;t = x % y;
	cdq
	idiv	y
	mov		t,edx

while1:					;while (t > 0) {
	cmp		t,0
	jg	while1_begin
	jmp	while1_end

while1_begin:
	mov		eax,y		;x = y;
	mov		x,eax

	mov		eax,t		;y = t;
	mov		y,eax
		
	mov		eax,x		;t = x % y;
	cdq
	idiv	y
	mov		t,edx
	
	jmp	while1			;}
while1_end:
	mov		eax,a		;answer = b * (a / y);
	cdq
	idiv	y
	mov		t,eax
	mov		ebx,b
	imul	ebx,t

	mov		eax,ebx
	ret					;return answer;

lcm endp				;}

end