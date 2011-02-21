# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils mono autotools

# Upstream seems to enjoy using random names.
MY_PN="mono-gio-sharp-4159f82"

DESCRIPTION="A branch of the official gtk-sharp/gio to get gio-sharp building on gtk-sharp 2.12"
HOMEPAGE="http://github.com/mono/gio-sharp"
SRC_URI="https://github.com/mono/gio-sharp/zipball/${PV} -> mono-gio-sharp-0.2.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=dev-lang/mono-2
        dev-dotnet/glib-sharp
        dev-dotnet/gtk-sharp-gapi
        >=dev-libs/glib-2.22:2"
DEPEND="${RDEPEND}
        app-arch/unzip"

S="${WORKDIR}/${MY_PN}"

src_prepare () {
        cd "${WORKDIR}/${MY_PN}/"
        ./autogen-2.22.sh
}

src_configure () {
        econf || die "configure failed"
}

src_compile() {
        emake -j1 || die "make failed"
}

src_install() {
        emake DESTDIR="${D}" install || die "install failed"
}