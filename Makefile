COMMENT = Cloudflare Tunnel client

CATEGORIES = net
MAINTAINER = Ilya Voronin <ivoronin@gmail.com>

HOMEPAGE = https://github.com/cloudflare/cloudflared

# Apache-2.0 license
PERMIT_PACKAGE = Yes

GH_ACCOUNT = cloudflare
GH_PROJECT = cloudflared
GH_TAGNAME = 2026.7.0

CLOUDFLARED_RELEASE_DATE = 2026-07-08

USE_GMAKE = Yes

MAKE_ENV +=	GOTOOLCHAIN=local
MAKE_ENV +=	GOPROXY=invalid://ports.should.not.fetch.at.buildtime/

MAKE_FLAGS +=	VERSION=${GH_TAGNAME} \
		DATE=${CLOUDFLARED_RELEASE_DATE}

FAKE_FLAGS = 	DESTDIR=${WRKINST} \
		PREFIX=${LOCALBASE} \
		VERSION=${GH_TAGNAME} \
		INSTALL_BINDIR=${TRUEPREFIX}/bin/ \
		INSTALL_MANDIR=${TRUEPREFIX}/man/man1/ \
		DATE=${CLOUDFLARED_RELEASE_DATE}

BUILD_DEPENDS = lang/go

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} ${MAKE_FLAGS} cloudflared

do-install:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} \
		${ALL_FAKE_FLAGS} ${INSTALL_TARGET}

.include <bsd.port.mk>
