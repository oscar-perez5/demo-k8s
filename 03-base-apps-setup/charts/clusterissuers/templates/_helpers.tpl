{{/*
Expand the name of the chart.
*/}}
{{- define "clusterissuers.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "clusterissuers.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "clusterissuers.labels" -}}
helm.sh/chart: {{ include "clusterissuers.chart" . }}
{{ include "clusterissuers.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "clusterissuers.selectorLabels" -}}
app.kubernetes.io/name: {{ include "clusterissuers.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
