cmake_minimum_required(VERSION 3.8)
project(EnTT_Pacman)

add_library(${PROJECT_NAME}
    src/comp/chase_target.hpp
    src/comp/dir.hpp
    src/comp/ghost.hpp
    src/comp/ghost_mode.hpp
    src/comp/home_position.hpp
    src/comp/player.hpp
    src/comp/position.hpp
    src/comp/sprite.hpp
    src/comp/target.hpp
    src/core/app.cpp
    src/core/app.hpp
    src/core/constants.hpp
    src/core/factories.cpp
    src/core/factories.hpp
    src/core/game.cpp
    src/core/game.hpp
    src/core/maze.cpp
    src/core/maze.hpp
    src/sys/can_move.cpp
    src/sys/can_move.hpp
    src/sys/change_ghost_mode.cpp
    src/sys/change_ghost_mode.hpp
    src/sys/eat_dots.cpp
    src/sys/eat_dots.hpp
    src/sys/house.cpp
    src/sys/house.hpp
    src/sys/movement.cpp
    src/sys/movement.hpp
    src/sys/player_ghost_collide.cpp
    src/sys/player_ghost_collide.hpp
    src/sys/player_input.cpp
    src/sys/player_input.hpp
    src/sys/pursue_target.cpp
    src/sys/pursue_target.hpp
    src/sys/render.cpp
    src/sys/render.hpp
    src/sys/set_target.cpp
    src/sys/set_target.hpp
    src/util/dir.hpp
    src/util/dir_to_pos.hpp
    src/util/frame_cap.hpp
    src/util/grid.hpp
    src/util/pos.hpp
    src/util/sdl_check.hpp
    src/util/sdl_delete.hpp
    src/util/sdl_load_texture.cpp
    src/util/sdl_load_texture.hpp
    src/util/sdl_quad_writer.cpp
    src/util/sdl_quad_writer.hpp
    src/util/sprites.cpp
    src/util/sprites.hpp
)

add_executable(pacman_exe
    src/main.cpp
)

if(CMAKE_TOOLCHAIN_FILE)
    message("Using SDL2 toolchain file")
    message(${CMAKE_TOOLCHAIN_FILE})
    find_package(SDL2 CONFIG REQUIRED)
    target_link_libraries(pacman_exe
        PRIVATE
        SDL2::SDL2
        SDL2::SDL2main
    )
else()
    message("Finding SDL2")
    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/modules/")
    find_package(SDL2 REQUIRED)

    target_include_directories(${PROJECT_NAME}
        PRIVATE
        "${SDL2_INCLUDE_DIR}"
    )
    target_link_libraries(${PROJECT_NAME}
        PRIVATE
        "${SDL2_LIBRARY}"
    )

    target_include_directories(pacman_exe
        PRIVATE
        "${SDL2_INCLUDE_DIR}"
    )
    target_link_libraries(pacman_exe
        PRIVATE
        ${PROJECT_NAME}
    )
endif()

target_include_directories(${PROJECT_NAME}
    PRIVATE
    "${CMAKE_SOURCE_DIR}/third_party"
    "${CMAKE_SOURCE_DIR}/src"
)
target_include_directories(pacman_exe
    PRIVATE
    "${CMAKE_SOURCE_DIR}/third_party"
    "${CMAKE_SOURCE_DIR}/src"
)

target_compile_features(${PROJECT_NAME}
    PRIVATE
    cxx_std_17
)
target_compile_features(pacman_exe
    PRIVATE
    cxx_std_17
)

if(CMAKE_BUILD_TYPE MATCHES DEBUG)
    target_compile_options(${PROJECT_NAME}
        PRIVATE
        -Wall -Wextra -Wpedantic
    )
    target_compile_options(pacman_exe
        PRIVATE
        -Wall -Wextra -Wpedantic
    )
endif()


###################
## Cmake Package ##
###################
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
    "${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
    VERSION 0.1
    COMPATIBILITY AnyNewerVersion
)
include(CMakePackageConfigHelpers)
configure_package_config_file(
    "${PROJECT_SOURCE_DIR}/cmake/${PROJECT_NAME}Config.cmake.in"
    "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    INSTALL_DESTINATION lib/cmake/${PROJECT_NAME}
)



#############
## Install ##
#############


install(TARGETS ${PROJECT_NAME}
    EXPORT ${PROJECT_NAME}Targets
    LIBRARY DESTINATION lib COMPONENT Runtime
    ARCHIVE DESTINATION lib COMPONENT Development
    RUNTIME DESTINATION bin COMPONENT Runtime
    PUBLIC_HEADER DESTINATION include COMPONENT Development
    BUNDLE DESTINATION bin COMPONENT Runtime
)
install(EXPORT ${PROJECT_NAME}Targets DESTINATION lib/cmake/${PROJECT_NAME})
install(FILES "${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
              "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
        DESTINATION lib/cmake/${PROJECT_NAME})
install(DIRECTORY ${PROJECT_SOURCE_DIR}/src/ DESTINATION include)

set_target_properties(pacman_exe PROPERTIES OUTPUT_NAME "pacman")
install(TARGETS pacman_exe
    RUNTIME DESTINATION bin COMPONENT Runtime
)
