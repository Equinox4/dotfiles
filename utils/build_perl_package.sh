#!/usr/bin/env sh

set -eu

if [ $# -lt 1 ]; then
    cat << EOF
This script allow you to build a ready-to-upload perl package on the Pause repository.

Usage:
$(basename $0) project_dir [output_dir]

The default output directory is the current directory.
EOF

    exit 0
fi

set -x

project_dir=$1
output_dir=${2:-`pwd`}

if [ ! -d "$project_dir" ]; then
    echo "Directory '$project_dir' not found."
    exit 0
fi

repo_path=`svn info --show-item url $project_dir`

tmp_dir=`mktemp -d`
svn export $repo_path "$tmp_dir/$project_dir"

(
cd "$tmp_dir/$project_dir"

perl Makefile.PL
make manifest
make dist
)

mv $tmp_dir/$project_dir/*.tar.gz $output_dir
rm -rf $tmp_dir
