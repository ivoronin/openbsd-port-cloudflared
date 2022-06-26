# Installation

1. Download the ports tree: `cd /usr ; cvs -d anoncvs@anoncvs.spacehopper.org:/cvs checkout -P ports`
1. Clone this repo: `git clone https://github.com/ivoronin/openbsd-port-cloudflared /usr/ports/mystuff/net/cloudflared`
1. Add the following line (separate fields with tabs) to the `/usr/ports/infrastructure/db/user.list`: `8080	_cloudflared	_cloudflared	net/cloudflared`
1. Build and install the port: `cd /usr/ports/mystuff/net/cloudflared ; make install`
