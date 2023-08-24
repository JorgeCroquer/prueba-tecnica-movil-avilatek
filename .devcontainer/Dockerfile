FROM ubuntu:20.04

# Timezone config
ENV TZ=America/Caracas
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget nano

WORKDIR /home/app

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/app/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mkdir Android/sdk/cmdline-tools
RUN mv cmdline-tools Android/sdk/cmdline-tools/tools
RUN cd Android/sdk/cmdline-tools/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/cmdline-tools/tools/bin && ./sdkmanager "build-tools;30.0.2" "patcher;v4" "platform-tools" "platforms;android-31" "sources;android-31"
RUN cd Android/sdk/cmdline-tools/tools/bin && ./sdkmanager "cmdline-tools;latest"
ENV PATH "$PATH:/home/app/Android/sdk/platform-tools"

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable
ENV PATH "$PATH:/home/app/flutter/bin"

# Install Oh my Bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Run basic check to download Dark SDK
RUN flutter doctor --android-licenses