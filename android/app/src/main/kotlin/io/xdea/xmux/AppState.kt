package io.xdea.xmux

import java.util.*

data class AppState(
    val queries: QueryState
)

data class QueryState(
    val timetable: Timetable
)

data class Timetable(
    val classes: List<Lesson>
)

data class Lesson(
    val cid: String,
    val name: String,
    val begin: Date,
    val end: Date,
)