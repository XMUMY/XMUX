package org.ctbeta.xmux.xmux

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import com.google.gson.Gson
import com.google.gson.annotations.SerializedName
import java.io.File


class CalendarWidget : AppWidgetProvider() {

  override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
    // There may be multiple widgets active, so update all of them
    for (appWidgetId in appWidgetIds) {
      updateAppWidget(context, appWidgetManager, appWidgetId)
    }
  }

  override fun onEnabled(context: Context) {
    // Enter relevant functionality for when the first widget is created
  }

  override fun onDisabled(context: Context) {
    // Enter relevant functionality for when the last widget is disabled
  }

  companion object {
    val gson = Gson()

    internal fun updateAppWidget(context: Context, appWidgetManager: AppWidgetManager,
                                 appWidgetId: Int) {
      getNextClass(context)

      // Construct the RemoteViews object
      val views = RemoteViews(context.packageName, R.layout.calendar_widget)

      // Instruct the widget manager to update the widget
      appWidgetManager.updateAppWidget(appWidgetId, views)
    }

    private fun getNextClass(context: Context) {
      val stateStr = File("${context.filesDir.parent}/app_flutter/state.dat").readText()
      val state = gson.fromJson<Map<String, Any>>(stateStr, Map::class.java)
      val encodedLessons = gson.toJson((state["acState"] as Map<*, *>)["timetable"])
      val lessons = gson.fromJson<Array<Lesson>>(encodedLessons, Array<Lesson>::class.java)
    }
  }
}


data class Lesson(val courseCode: String,
                  val courseName: String,
                  @SerializedName("classRoom") val classroom: String)