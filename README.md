# Шаблон Umba-проекта

  - [Настройка проекта на базе данного шаблона](#user-content-настройка-проекта-на-базе-данного-шаблона)
    - [Настройка CMakeLists.txt](#user-content-настройка-cmakeliststxt)
      - [Название проекта](#user-content-название-проекта)
      - [Настройка библиотеки](#user-content-настройка-библиотеки)
      - [Добавление целей](#user-content-добавление-целей)
    - [Настройка запуска MSVC](#user-content-настройка-запуска-msvc)
  - [Сборка и отладка проекта](#user-content-сборка-и-отладка-проекта)
    - [Извлечение библиотек](#user-content-извлечение-библиотек)
    - [Генерация сборочных скриптов и сборка](#user-content-генерация-сборочных-скриптов-и-сборка)
    - [Открытие проекта в IDE](#user-content-открытие-проекта-в-ide)
      - [Запуск VSCode](#user-content-запуск-vscode)
      - [Запуск MSVC](#user-content-запуск-msvc)


Для подключения и использования необходимых библиотек их нужно раскомментировать в файлах:

 - `_libs/_clone_libs.bat`
 - `_libs/_git-job-impl.bat`


# Настройка проекта на базе данного шаблона

## Настройка CMakeLists.txt

### Название проекта

В начале файла находим строку описания проекта (с директивой `project`):

CMakeLists.txt:2
```cmake
2: project(umba-template VERSION 0.1.0 LANGUAGES C CXX)
```

Заменяем название `umba-template` на название проекта.



### Настройка библиотеки

Импортируем нужные библиотеки:

CMakeLists.txt:30
```cmake
30: # Import libraries here
31: # add_subdirectory(${LIB_ROOT}/encoding)
32: # add_subdirectory(${LIB_ROOT}/marty_cpp)
33: # add_subdirectory(${LIB_ROOT}/marty_pugixml)
34: # add_subdirectory(${LIB_ROOT}/marty_tr)
35: # add_subdirectory(${LIB_ROOT}/marty_yaml_toml_json)
36: # add_subdirectory(${LIB_ROOT}/nlohmann)    # https://json.nlohmann.me/integration/cmake/#external
37: # add_subdirectory(${LIB_ROOT}/pugixml)
38: # add_subdirectory(${LIB_ROOT}/sfmt)
39: # add_subdirectory(${LIB_ROOT}/umba)
40: # add_subdirectory(${LIB_ROOT}/yaml-cpp)
```


Настраиваем списки библиотек для последующего использования:

CMakeLists.txt:97
```cmake
 97: # Configure libraries here
 98: # set(COMMON_LIBS encoding::encoding marty_cpp::marty_cpp sfmt::sfmt umba::umba)
 99: #set(PUGIXML_LIB pugixml::pugixml marty_pugixml::marty_pugixml)
100: # set(JSON_YAML_LIB nlohmann_json::nlohmann_json yaml-cpp::yaml-cpp)
```

При настройке целей можно как использовать заранее подготовленные списки библиотек, так и указывать библиотеки непосредственно.


### Добавление целей

Настраиваем цель (исполняемый файл) проекта:

CMakeLists.txt:106
```cmake
106: add_executable(umba-template "${SRC_ROOT}/umba-template/umba-template.cpp" "${headers}")
107: umba_add_target_options(umba-template "CONSOLE" "BIGOBJ" "UTF8" ) # "PEDANTIC" "WERR"
108: target_link_libraries(umba-template PRIVATE "${PLATFORM_LIBS}" "${COMMON_LIBS}")
```

При необходимости дополнительные цели можно добавлять аналогично.


## Настройка запуска MSVC

Для открытия проекта в MSVC нужно настроить название "солюшена":

set_sln.bat:2
```
2: @set SLN=umba-template
```

Это название должно совпадать с тем, что указано в директиве `project` файла `CMakeLists.txt`.



# Сборка и отладка проекта


## Извлечение библиотек

Для сборки проекта требуются внешнте библиотеки. Внешние библиотеки не подгружаются автоматически.
Для их подгрузки требуется выполнить скрипт `_libs/_clone_libs.bat`.


## Генерация сборочных скриптов и сборка

Для генерации сборочных скриптов и их сборки при помощи `MSBuild` предназначены файлы:

 - `.bat/build_all_msvc2019.bat`
 - `.bat/build_all_msvc2022.bat`
 - `.bat/cmake_generate_msvc2019.bat`
 - `.bat/cmake_generate_msvc2022.bat`


## Открытие проекта в IDE

### Запуск VSCode

Для запуска VSCode предназначен файл `_start_code.bat`. 
VSCode с плагином "CMake Tools" сам обнаружит `CMakeLists.txt`. Следует выбрать подходящий тулчейн
и можно начинать работу.


### Запуск MSVC

Для запуска MSVC предназначен файл `_start_msvc.bat`.
По умолчанию будет сгенерированна и открыта в 2019ой студии конфигурация `x86`.
Для того, чтобы открывалась другая студия с другой конфигурацией, следует
переименовать файл `setup_msvc.bat.example` в `setup_msvc.bat` и настроить нужную конфигурацию там.



