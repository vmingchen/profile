export JAVA_HOME=$HOME/software/java
export PATH=$PATH:$JAVA_HOME/bin:/usr/lib/llvm-3.5/bin/:$HOME/.bazel/bin
if [[ -f  /home/mchen/.bazel/lib/bazel/bin/bazel-complete.bash ]]; then
  source /home/mchen/.bazel/lib/bazel/bin/bazel-complete.bash
fi
