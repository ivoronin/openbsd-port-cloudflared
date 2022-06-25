COMMENT = Cloudflare Tunnel client

CATEGORIES = net
MAINTAINER = Ilya Voronin <ivoronin@gmail.com>

HOMEPAGE = https://github.com/cloudflare/cloudflared

# Apache-2.0 license
PERMIT_PACKAGE = Yes

GH_ACCOUNT = cloudflare
GH_PROJECT = cloudflared
GH_TAGNAME = 2022.6.3

USE_GMAKE = Yes

FAKE_FLAGS = 	DESTDIR=${WRKINST} \
		PREFIX=${LOCALBASE} \
		MANDIR=${TRUEPREFIX}/man

#WRKDIST = ${WRKSRC}

BUILD_DEPENDS = lang/go

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} cloudflared

do-install:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_FAKE_FLAGS} ${INSTALL_TARGET}

.include <bsd.port.mk>
