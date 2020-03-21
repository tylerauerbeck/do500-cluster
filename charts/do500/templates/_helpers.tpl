{{- define "gitlab.ldap.port" -}}
{{- $ldap := (index (lookup "config.openshift.io/v1" "OAuth" "" "cluster").spec.identityProviders 0) -}}
{{- $protocol := regexFind "^ldap[s]*" $ldap.ldap.url -}}
{{- if eq $protocol "ldap" }}
{{- print "389" -}}
{{- else -}}
{{- print "689" -}}
{{- end -}}
{{- end -}}

{{- define "gitlab.ldap.base" -}}
{{ $ldap := (index (lookup "config.openshift.io/v1" "OAuth" "" "cluster").spec.identityProviders 0) }}
{{- regexReplaceAll "^ldap[s]*://" $ldap.ldap.url "${1}" | regexFind "/.*" | trimAll "/" }}
{{- end -}}

{{- define "gitlab.ldap.uri" -}}
{{ $ldap := (index (lookup "config.openshift.io/v1" "OAuth" "" "cluster").spec.identityProviders 0) }}
{{- regexReplaceAll "^ldap[s]*://" $ldap.ldap.url "${1}" | regexFind ".*/" | trimAll "/" }}
{{- end -}}

{{- define "gitlab.ldap.user_filter" -}}
{{ $ldap := (index (lookup "config.openshift.io/v1" "OAuth" "" "cluster").spec.identityProviders 0) }}
{{- regexReplaceAll "^ldap[s]*://" $ldap.ldap.url "${1}" | regexFind "\\?.*" | trimAll "?" }}
{{- end -}}

{{- define "gitlab.ldap.validate_certs" -}}
{{ $ldap := (index (lookup "config.openshift.io/v1" "OAuth" "" "cluster").spec.identityProviders 0) }}
{{- if eq $ldap.ldap.insecure true -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}

{{- define "gitlab.ldap.bind_password" -}}
{{- if (lookup "v1" "Secret" "openshift-config" "ldap-secret") }}
{{ print (lookup "v1" "Secret" "openshift-config" "ldap-secret").data.bindPassword | b64dec -}}
{{- end }}
{{- end }}

{{- define "gitlab.ldap.bind_dn" -}}
{{ $ldap := (index (lookup "config.openshift.io/v1" "OAuth" "" "cluster").spec.identityProviders 0) }}
{{- print $ldap.ldap.bindDN -}}
{{- end -}}

{{- define "do500.app_domain" -}}
{{- print (lookup "operator.openshift.io/v1" "IngressController" "openshift-ingress-operator" "default").status.domain -}}
{{- end -}}

{{- define "gitlab.root_password" -}}
{{- print (randAlphaNum 10) -}}
{{- end -}}

{{- define "gitlab.postgres.user" -}}
{{- print (randAlphaNum 10) -}}
{{- end -}}

{{- define "gitlab.postgres.password" -}}
{{- print (randAlphaNum 10) -}}
{{- end -}}

{{- define "gitlab.postgres.admin_password" -}}
{{- print (randAlphaNum 10) -}}
{{- end -}}
