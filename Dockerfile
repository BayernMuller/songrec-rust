# Dockerfile
FROM rust:1.56 as builder

# 기반 이미지로 Rust를 선택합니다.
# 크로스 컴파일을 위한 타겟 추가
RUN rustup target add armv7-unknown-linux-gnueabihf

# 필요한 라이브러리 설치
RUN dpkg --add-architecture armhf
RUN apt update
RUN apt install -y musl-tools
RUN apt install -y build-essential 
RUN apt install -y pkg-config
RUN apt install -y libasound2-dev:armhf 
RUN apt install -y libglib2.0-dev:armhf 
RUN apt install -y gettext:armhf 
RUN apt install -y libdbus-1-dev:armhf 
RUN apt install -y libssl-dev:armhf 
RUN apt install -y gcc-arm-linux-gnueabihf 
RUN apt install -y libsystemd-dev:armhf

RUN arm-linux-gnueabihf-gcc --version; sleep 5

# 컨테이너 내부에 작업 디렉토리를 생성합니다.
WORKDIR /usr/src/songrec

# 로컬 시스템에서 현재 디렉토리의 내용을 컨테이너의 /usr/src/myapp 디렉토리로 복사합니다.
COPY . .

# 환경 변수 설정. 이 부분은 프로젝트에 따라 수정이 필요할 수 있습니다.
ENV PKG_CONFIG_ALLOW_CROSS=1
ENV PKG_CONFIG_ALL_STATIC=1
ENV PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig
ENV CC_armv7_unknown_linux_gnueabihf=arm-linux-gnueabihf-gcc

# 빌드 과정 수행
RUN cargo build --release --target=armv7-unknown-linux-gnueabihf --verbose

# 두 번째 단계에서 빌드된 바이너리를 복사
FROM debian:stretch

WORKDIR /app

COPY --from=builder /usr/src/songrec/target/armv7-unknown-linux-gnueabihf/release/songrec /app/
