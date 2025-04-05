package com.example.essa

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.widget.RemoteViews
import com.example.essa.R // Import correct

class MusicWidget : AppWidgetProvider() {

    override fun onUpdate(
        context: Context?,
        appWidgetManager: AppWidgetManager?,
        appWidgetIds: IntArray?
    ) {
        appWidgetIds?.forEach { appWidgetId ->
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    companion object {
        internal fun updateAppWidget(
            context: Context?,
            appWidgetManager: AppWidgetManager?,
            appWidgetId: Int
        ) {
            val safeContext = context ?: return
            val safeAppWidgetManager = appWidgetManager ?: return

            val views = RemoteViews(safeContext.packageName, R.layout.music_widget)

            // Configuration du texte
            views.setTextViewText(
                R.id.appwidget_text,
                safeContext.getString(R.string.appwidget_text)
            )

            // Configuration du bouton
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse("app://music_player/play"))
            val pendingIntent = PendingIntent.getActivity(
                safeContext,
                0,
                intent,
                PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT
            )
            views.setOnClickPendingIntent(R.id.button_play_pause, pendingIntent)

            // Mise à jour du widget
            safeAppWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}