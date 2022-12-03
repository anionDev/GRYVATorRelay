FROM alpine:latest

ARG EnvironmentStage

RUN mkdir /Workspace
WORKDIR /Workspace

RUN apk --no-cache add --update git bash

RUN git clone --single-branch --branch main https://github.com/anionDev/ScriptCollection.git

RUN chmod -R +x ./ScriptCollection/Other/OtherScripts

RUN ./ScriptCollection/Other/OtherScripts/ServerMaintenance/Alpine/Anonymous/TorInstall.sh

RUN ./ScriptCollection/Other/OtherScripts/ServerMaintenance/Alpine/Common/CreateUser.sh "user" "/Workspace/userhome" "false" "" "false" "false"

COPY ./torrc.template /Workspace/userhome/torrc

COPY ./EntryPointScript.sh /Workspace/userhome/EntryPointScript.sh
RUN chmod +x /Workspace/userhome/EntryPointScript.sh

RUN mkdir -p /Workspace/userhome
RUN chown -R user:1000 /Workspace/userhome

RUN ./ScriptCollection/Other/OtherScripts/ServerMaintenance/Alpine/Common/ConfigureSystem.sh "$EnvironmentStage" "/Workspace/ScriptCollection" "" "/Workspace"

RUN tor --version

USER user
WORKDIR /Workspace/userhome

ENTRYPOINT ["/Workspace/userhome/EntryPointScript.sh"]
