;Name: Sydney Honyouti
;Due date: 11/4/2019
;Function: int properFactors(int n, int factors[], int& numFactors)
;Program description: The program will find all the proper factors of n,
;store them in an integer array passed by reference in the parameter list,
;store the number of proper factors in an integer parameter passed by reference,
;and return the sum of all the proper factors as the function's return value.
	.386
	.model flat, C
	.data
k		dd	?	;int k
i		dd	?	;int i
sum		dd	?	;int sum
factor2	dd	?	;int factor2
	.code
properFactors proc uses ebx ecx edx edi esi, n:dword, factors:ptr, numFactors:ptr ;int properFactors(int n, int factors[], int& numFactors) {

	mov ebx,factors				; use ecx to hold base address for factors[]
	mov k,2						; int k = 2; 
	mov	sum,1					; int sum = 1;
	mov	factor2,0				; int factor2 = 0;
	mov	i,1						; int i = 1;
	mov	dword ptr [ebx],1		;factors[0] = 1;

while_1:							;	while (k * k <= n)
	mov eax,k
	imul eax,k
	cmp	eax,n
	jle	while_1_begin
	jmp	while_1_end
while_1_begin:						;	{
if_1:								;		if (n % k == 0)
	mov	eax,n
	cdq
	idiv k
	cmp	edx,0
	je	if_1_begin
	jmp	if_1_end
if_1_begin:							;		{
	mov eax,sum						;			sum += k;
	add	eax,k
	mov	sum,eax

	mov	eax,k						;			factors[i] = k;
	mov	ecx,i
	mov dword ptr [ebx+4*ecx],eax

	inc	i							;			i++;

	mov	eax,n						;			factor2 = n / k;
	cdq
	idiv k
	mov	factor2,eax
if_2:								;			if (factor2 != k)
	mov	eax,k
	cmp	factor2,eax
	jne	if_2_begin
	jmp	if_2_end					;			{
if_2_begin:							;				sum += factor2;
	mov	eax,sum
	add	eax,factor2
	mov	sum,eax

	mov	eax,factor2					;				factors[i] = factor2;
	mov	ecx,i
	mov	dword ptr [ebx+4*ecx],eax

	inc i							;				i++;
if_2_end:							;			}
if_1_end:							;		}
	inc k							;		k++;
	jmp	while_1
while_1_end:						;	}
	mov	edi,numFactors				;	numFactors = i;
	mov	eax,i
	mov	dword ptr [edi],eax				

	mov	eax,sum						;	return sum;
	ret
properFactors endp					;}
end