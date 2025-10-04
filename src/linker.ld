ENTRY(start)
OUTPUT_FORMAT(elf32-i386)



SECTIONS {
	
	.multiboot 0x100000 : {
		*(.multiboot)
	} : exec
	
	. = 0x100000 + SIZEOF(.multiboot);
	
	.text : {
		*(.text)
	} :exec
	
	.rodata : {
		*(.rodata)
    } : read
	
	.data : {
		*(.data)
	} : readwrite
	.bss : {
		__bss_start = .;
		*(COMMON)
		*(.bss)
		__bss_end = .;
	} : readwrite
	
	/DISCARD/ : {
		*(.comment)
		*(.note*)
	}
}

PHDRS {
	exec PT_LOAD FLAGS(5);
	read PT_LOAD FLAGS(4);
	readwrite PT_LOAD FLAGS(6);
}
	