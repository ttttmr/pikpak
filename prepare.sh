[ $CF_DOMAIN ] && {
  [ "$CF_DOMAIN" == "DIRECT" ] && sed -i "/\[/,/]/cexport const proxy = []" src/config/index.ts || \
  sed -i "/\[/,/]/cexport const proxy = ['https://$CF_DOMAIN']" src/config/index.ts;
}
[ $BASE_PATH ] || BASE_PATH="/${REPO_NAME}"
[ "$BASE_PATH" != "/pikpak" ] && sed -i "s|/pikpak|$BASE_PATH|g" vite.config.ts
[ $INVITE_CODE ] && sed -i "s|apk/url/225815|apk/url/$INVITE_CODE|g" src/views/login.vue
[ $CF_INVITE ] && sed -i "s/invite.z7.workers.dev/$CF_INVITE/g" src/views/register.vue src/views/sms.vue src/views/testtest.vue
[ $CNAME_DOMAIN ] && echo "$CNAME_DOMAIN" > public/CNAME
