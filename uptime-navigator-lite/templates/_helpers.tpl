{{- define "uptime-navigator-lite.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "uptime-navigator-lite.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "uptime-navigator-lite.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "uptime-navigator-lite.labels" -}}
helm.sh/chart: {{ include "uptime-navigator-lite.chart" . }}
{{ include "uptime-navigator-lite.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "uptime-navigator-lite.selectorLabels" -}}
app.kubernetes.io/name: {{ include "uptime-navigator-lite.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "uptime-navigator-lite.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "uptime-navigator-lite.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
