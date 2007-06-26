# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit kde

DESCRIPTION="A NetworkManager front-end for KDE"
HOMEPAGE="http://en.opensuse.org/Projects/KNetworkManager"
LICENSE="GPL-2"
SRC_URI="http://www.sabayonlinux.org/distfiles/net-misc/${PN}/${P}~r674918.tar.gz"
KEYWORDS=""
RESTRICT="nomirror"

DEPEND=">=net-misc/networkmanager-0.6.3
	>=kde-base/kdelibs-3.2
	|| ( >=dev-libs/dbus-qt3-old-0.70
		( <sys-apps/dbus-0.70 ) )
	sys-apps/hal"

S="${WORKDIR}/${P}~r674918"

src_unpack() {

	unpack ${A}
	cd ${S}
	#for patch in debian/patches/*.patch; do
	#	epatch $patch
	#done

}

src_compile() {
	UNSERMAKE="no"
	kde_src_compile
}
