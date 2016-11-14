call :build 4.6.2 4.6 4
call :build 6.9.1 6.9 6
call :build 7.1.0 7.1 7

goto eof
:build
setlocal
docker build -t node:%1 %2 || exit /b
docker tag node:%1 node:latest || exit /b
docker tag node:%1 node:%2 || exit /b
docker tag node:%1 node:%3 || exit /b

docker build -t node:%1-onbuild %2/onbuild
docker tag node:%1-onbuild node:%2-onbuild || exit /b
docker tag node:%1-onbuild node:%3-onbuild || exit /b

docker build -t node:%1-nano %2/nano || exit /b
docker tag node:%1-nano node:latest-nano || exit /b
docker tag node:%1-nano node:%2-nano || exit /b
docker tag node:%1-nano node:%3-nano || exit /b

docker build -t node:%1-nano-onbuild %2/nano/onbuild || exit /b
docker tag node:%1-nano-onbuild node:%2-nano-onbuild || exit /b
docker tag node:%1-nano-onbuild node:%3-nano-onbuild || exit /b
endlocal
