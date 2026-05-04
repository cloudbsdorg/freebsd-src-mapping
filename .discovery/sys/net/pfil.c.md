PURPOSE
$NetBSD: pfil.c,v 1.20 2001/11/12 23:49:46 lukem Exp $

KEY FUNCTIONS
- pfil_add_hook
- pfil_head_register
- pfil_head_unregister
- pfil_link
- pfil_mbuf_fwd
- pfil_mbuf_in
- pfil_mbuf_out
- pfil_mem_in
- pfil_mem_out
- pfil_remove_hook

INCLUDES
- sys/param.h
- sys/conf.h
- sys/kernel.h
- sys/epoch.h
- sys/errno.h
- sys/lock.h
- sys/malloc.h
- sys/socket.h
- sys/socketvar.h
- sys/systm.h
- sys/mutex.h
- sys/proc.h
- sys/queue.h
- sys/ucred.h
- sys/jail.h
- net/if.h
- net/if_var.h
- net/pfil.h

DEPENDS_ON
- sys/param.h
- sys/conf.h
- sys/kernel.h
- sys/epoch.h
- sys/errno.h
- sys/lock.h
- sys/malloc.h
- sys/socket.h
- sys/socketvar.h
- sys/systm.h
- sys/mutex.h
- sys/proc.h
- sys/queue.h
- sys/ucred.h
- sys/jail.h
- net/if.h
- net/if_var.h
- net/pfil.h
