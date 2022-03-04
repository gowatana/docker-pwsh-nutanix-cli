FROM mcr.microsoft.com/powershell:7.2.1-centos-7-20220223

LABEL maintainer "Go Watanabe / gowatana@vmtn.jp"

RUN pwsh -c Set-PSRepository -Name PSGallery -InstallationPolicy Trusted && \
    pwsh -c Install-Module -Name Nutanix.Cli -RequiredVersion 2.0.1
RUN mkdir -p /root/.config/powershell; \
    echo 'function prompt {"pwsh-nutanix> "}' >> /root/.config/powershell/Microsoft.PowerShell_profile.ps1

CMD pwsh -NoExit -c Import-Module Nutanix.Cli

