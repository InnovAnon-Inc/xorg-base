FROM innovanon/doom-base:latest as builder-01
COPY --from=innovanon/zlib        /tmp/zlib.txz        /tmp/
COPY --from=innovanon/bzip2       /tmp/bzip2.txz       /tmp/
COPY --from=innovanon/xz          /tmp/xz.txz          /tmp/
COPY --from=innovanon/libpng      /tmp/libpng.txz      /tmp/
COPY --from=innovanon/jpeg-turbo  /tmp/jpeg-turbo.txz  /tmp/
COPY --from=innovanon/sdl         /tmp/sdl.txz         /tmp/
USER root
COPY ./xorg.sh /etc/profile.d/
COPY ./xorg    /etc/sudoers.d/
RUN extract.sh                                              \
 && chmod -v 644 /etc/profile.d/xorg.sh                     \
 && echo "$XORG_PREFIX/lib" >> /etc/ld.so.conf              \
 && if [[ -f /etc/man_db.conf ]] ; then                     \
      sed "s@/usr/X11R6@$XORG_PREFIX@g" -i /etc/man_db.conf \
    ; fi                                                    \
 && ln -svf $XORG_PREFIX/share/X11 /usr/share/X11           \
 && ln -svf $XORG_PREFIX /usr/X11R6

#FROM builder-01 as squash-tmp
#USER root
#RUN  squash.sh
#FROM scratch as squash
#ADD --from=squash-tmp /tmp/final.tar /

FROM builder-01
