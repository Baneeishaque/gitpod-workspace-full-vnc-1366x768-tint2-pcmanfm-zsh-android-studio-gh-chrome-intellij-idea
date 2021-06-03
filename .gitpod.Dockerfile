FROM baneeishaque/gitpod-workspace-full-vnc-1366x768-tint2-pcmanfm-zsh-android-studio-gh-chrome

RUN bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh && sdk default java 11.0.10.fx-zulu"

ARG intellijIdeaDownloadUrl="https://download.jetbrains.com/idea/ideaIU-2021.1.2.tar.gz"
ARG intellijIdeaInstallationFile="ideaIU-2021.1.2.tar.gz"

RUN cd $HOME \
 && wget $intellijIdeaDownloadUrl \
 && sudo tar -xvf $intellijIdeaInstallationFile -C /usr/local/ \
 && rm $intellijIdeaInstallationFile

RUN mkdir -p ~/.config/JetBrains/IntelliJIdea2021.1 \
 && cp /usr/local/idea-IU-211.7442.40/bin/idea64.vmoptions ~/.config/JetBrains/IntelliJIdea2021.1/ \
 && echo "-Dsun.java2d.xrender=false" >> ~/.config/JetBrains/IntelliJIdea2021.1/idea64.vmoptions
