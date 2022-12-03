FROM debian:stable-slim

ARG TargetEnvironmentType
ARG Version="0.1.9"

RUN mkdir /Workspace
WORKDIR /Workspace

RUN apt-get -y update
RUN apt-get install -y git

RUN git clone --single-branch --branch main https://github.com/anionDev/ScriptCollection.git

RUN chmod -R +x ./ScriptCollection/Other/OtherScripts

RUN ./ScriptCollection/Other/OtherScripts/ServerMaintenance/Debian/Anonymous/TorInstall.sh

RUN ./ScriptCollection/Other/OtherScripts/ServerMaintenance/Debian/Common/CreateUser.sh "user" "/Workspace/userhome" "false" "" "false" "false"

COPY ./torrc.template /Workspace/userhome/torrc

COPY ./EntryPointScript.sh /Workspace/userhome/EntryPointScript.sh
RUN chmod +x /Workspace/userhome/EntryPointScript.sh

RUN mkdir -p /Workspace/userhome
RUN chown -R user:1000 /Workspace/userhome

RUN ./ScriptCollection/Other/OtherScripts/ServerMaintenance/Debian/Common/ConfigureSystem.sh "$TargetEnvironmentType" "/Workspace/ScriptCollection" "" "/Workspace"

RUN tor --version

USER user
WORKDIR /Workspace/userhome

ENTRYPOINT ["/Workspace/userhome/EntryPointScript.sh"]
