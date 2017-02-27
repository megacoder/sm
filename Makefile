TARGETS	=all check clean clobber diff distclean import install uninstall
TARGET	=all

SUBDIRS	=

.PHONY:	${TARGETS} ${SUBDIRS}

PREFIX	=${DESTDIR}/opt
BINDIR	=${PREFIX}/bin

INSTALL	=install

all::	sm

${TARGETS}::

clobber distclean:: clean

check::	sm
	./sm ${ARGS}

install:: sm
	${INSTALL} -D -c sm ${BINDIR}/sm

uninstall::
	${RM} ${BINDIR}/sm

# Keep at bottom so we do local stuff first.

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}

${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
