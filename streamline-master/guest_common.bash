pollute_cluster_env() {
	USER="$(id -un)"
	LOGNAME="${USER}"
	export USER LOGNAME

	: ${LD_LIBRARY_PATH:=}
	: ${PYTHONHOME:=$(default_python_home)}

	source /build/install/greenplum_path.sh
	source /build/gpdb/gpAux/gpdemo/gpdemo-env.sh
}

default_python_home() {
	python <<-EOF
	import sys
	print(sys.prefix)
	EOF
}

