pkg_name=compliance
pkg_origin=eric
pkg_version="0.1.0"
pkg_maintainer="Eric Calabretta <ecalabretta@chef.io>"
pkg_upstream_url=https://www.github.com/ericcalabretta/compliance
pkg_license=("Apache-2.0")
pkg_deps=("chef/inspec" "core/cacerts")
pkg_svc_user="root"

do_download() {
  return 0;
}

do_build() {
  return 0;
}

do_install() {
  return 0;
}
