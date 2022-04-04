package io.xdea.xmux

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceModifier
import androidx.glance.LocalContext
import androidx.glance.action.actionStartActivity
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.appWidgetBackground
import androidx.glance.appwidget.cornerRadius
import androidx.glance.appwidget.lazy.LazyColumn
import androidx.glance.background
import androidx.glance.layout.*
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import com.google.gson.GsonBuilder
import com.google.gson.JsonSyntaxException
import java.text.SimpleDateFormat


class TimetableWidget : GlanceAppWidget() {
    private fun getTimetable(context: Context): List<Lesson>? {
        val appStateJson = context
            .getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            .getString("flutter.app_state", "")!!
        if (appStateJson.isEmpty()) return null

        val appState: AppState?
        try {
            appState = GsonBuilder()
                .setDateFormat("yyyy-MM-dd'T'HH:mm:ssz")
                .create()
                .fromJson(appStateJson, AppState::class.java)
        } catch (e: JsonSyntaxException) {
            return null
        }

        return appState?.queries?.timetable?.classes
    }

    @Composable
    override fun Content() {
        val classes = getTimetable(LocalContext.current)
        Column(
            modifier = GlanceModifier
                .fillMaxSize()
                .background(Color(0xFFFFFFFF))
                .appWidgetBackground()
                .cornerRadius(12.dp)
                .padding(12.dp)
        ) {
            Text(
                text = "Timetable",
                modifier = GlanceModifier.fillMaxWidth().padding(bottom = 8.dp),
                style = TextStyle(fontWeight = FontWeight.Bold, fontSize = 16.sp),
            )
            classes?.let {
                LazyColumn {
                    items(it.size, { i -> i.toLong() }) { i ->
                        val cls = it[i]
                        val format = SimpleDateFormat("HH:mm")
                        val begin = format.format(cls.begin)
                        val end = format.format(cls.end)

                        Box(
                            modifier = GlanceModifier
                                .fillMaxWidth()
                                .padding(6.dp)
                                .clickable(actionStartActivity<MainActivity>())
                        ) {
                            Text(text = "${cls.cid} $begin-$end\n${cls.name}")
                        }
                    }
                }
            }
        }
    }
}


class TimetableWidgetReceiver : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = TimetableWidget()
}