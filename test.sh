set -e

echo removing generated files
rm .gradle buildSrc/.gradle subproject/.gradle build subproject/build buildSrc/build -rf

echo building project
./gradlew --no-daemon :subproject:compileJava :subproject:sampleCopy 

echo modifying buildSrc
echo >> buildSrc/src/main/kotlin/androidx/build/Sample.kt 

echo building project a second time
./gradlew --no-daemon :subproject:compileJava :subproject:sampleCopy -PdisallowExecution --info

echo notice that compileJava and compileKotlin were considered out-of-date, but sampleCopy was considered up-to-date
