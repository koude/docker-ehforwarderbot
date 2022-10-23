FROM alpine:latest

ENV LANG C.UTF-8
ENV EFB_DATA_PATH /efb/
ENV PROFILE default

RUN apk add --no-cache \
    tzdata \ 
    ca-certificates \
    python3 \
    ffmpeg \
    libmagic \
    libwebp \
    py3-pip
RUN apk add --no-cache --virtual .build-tmp git build-base gcc python3-dev \
    && pip3 install wheel pillow pydub \ 
    && pip3 install git+https://github.com/ehForwarderBot/ehForwarderBot \
#   && pip3 install git+https://github.com/ehforwarderbot/efb-telegram-master \
    && pip3 install git+https://github.com/mlch911/efb-telegram-master \ 
    && pip3 install git+https://github.com/ehforwarderbot/efb-wechat-slave \ 
    && pip3 install git+https://github.com/0honus0/python-comwechatrobot-http.git \ 
    && pip3 install git+https://github.com/0honus0/efb-wechat-comwechat-slave.git \ 
    && pip3 install lottie cairosvg \ 
    && pip3 install git+https://github.com/QQ-War/efb_message_merge.git \ 
    && pip3 install git+https://github.com/iaurman/efb-msg-filter \ 
    && pip3 install git+https://github.com/ehForwarderBot/efb-patch-middleware \ 
#   && pip3 install git+https://github.com/MatrixLau/efb-solitaire_optimize-middleware \ 
    && pip3 install git+https://github.com/ehForwarderBot/efb-voice_recog-middleware \  
    && apk del .build-tmp \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ENTRYPOINT ehforwarderbot  -p ${PROFILE}
