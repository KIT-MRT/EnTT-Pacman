//
//  maze.hpp
//  EnTT Pacman
//
//  Created by Indiana Kernick on 22/9/18.
//  Copyright © 2018 Indiana Kernick. All rights reserved.
//

#ifndef CORE_MAZE_HPP
#define CORE_MAZE_HPP

#include <cstdint>
#include "util/grid.hpp"
#include "util/pos.hpp"

enum class Tile : std::uint8_t { empty, dot, energizer, wall, door };

using MazeState = Grid<Tile>;

namespace {

Tile stateChar(const char c) {
    switch (c) {
    case ' ':
        return Tile::empty;
    case '.':
        return Tile::dot;
    case 'o':
        return Tile::energizer;
    case '#':
        return Tile::wall;
    case '-':
        return Tile::door;
    default:
        assert(false);
        return {};
    }
}

template <std::size_t Size>
void stateStr(MazeState& state, const char (&str)[Size]) {
    assert(state.area() + 1 == Size);
    for (std::size_t i = 0; i != Size - 1; ++i) {
        state[i] = stateChar(str[i]);
    }
}

} // namespace

MazeState makeMazeState();

template <std::size_t Size>
MazeState makeCustomMazeState(const Pos& size, const char (&str)[Size]) {
    MazeState state{size};
    stateStr(state, str);
    return state;
}

#endif
