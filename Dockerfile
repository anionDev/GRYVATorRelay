FROM debian:stable-slim

ARG DEBIAN_FRONTEND=noninteractive
ARG EnvironmentStage

RUN apt-get -y update
RUN apt-get -y install git
RUN mkdir /Workspace
WORKDIR /Workspace
RUN git clone --single-branch --branch master git://github.com/anionDev/ScriptCollection.git
RUN chmod -R +x ./ScriptCollection/Other

RUN ./ScriptCollection/Other/ServerMaintenance/Anonymous/TorInstall.sh

RUN ./ScriptCollection/Other/ServerMaintenance/Common/CreateUser.sh "user" "/userhome" "false" "" "false" "false"

COPY Utilities/torrc.template /userhome/torrc

COPY Utilities/EntryPointScript.sh /userhome/EntryPointScript.sh
RUN chmod +x /userhome/EntryPointScript.sh

RUN chown -R user:user /userhome

RUN ./ScriptCollection/Other/ServerMaintenance/Common/ConfigureSystem.sh "$EnvironmentStage" "/Workspace/ScriptCollection" "" "/Workspace"

USER user
WORKDIR /userhome

ENTRYPOINT ["/userhome/EntryPointScript.sh"]
