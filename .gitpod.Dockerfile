FROM baneeishaque/gitpod-workspace-full-vnc-1366x768-tint2-pcmanfm-zsh-android-studio-gh-chrome

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk default java 11.0.10.fx-zulu"

ARG intellijIdeaDownloadUrl="https://download.jetbrains.com/idea/ideaIU-2021.1.tar.gz"
ARG intellijIdeaInstallationFile="ideaIU-2021.1.tar.gz"

RUN cd $HOME \
 && wget $intellijIdeaDownloadUrl | tee -a /tmp/wget-intellijIdea.log \
 && sudo tar -xvf $intellijIdeaInstallationFile -C /usr/local/ | tee -a /tmp/tar-intellijIdea.log\
 && rm $intellijIdeaInstallationFile

RUN mkdir -p ~/.config/JetBrains/IntelliJIdea2021.1 \
 && cp /usr/local/idea-IU-211.6693.111/bin/idea64.vmoptions ~/.config/JetBrains/IntelliJIdea2021.1/ \
 && echo "-Dsun.java2d.xrender=false" >> ~/.config/JetBrains/IntelliJIdea2021.1/idea64.vmoptions
