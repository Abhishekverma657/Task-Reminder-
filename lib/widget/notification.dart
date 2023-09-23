 
 import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
 
  class NotificationWidget{
    
     static  FlutterLocalNotificationsPlugin notificationsPlugin=FlutterLocalNotificationsPlugin();
      

     static Future init({bool scheduled=false})async{
       var initAndroidetting =AndroidInitializationSettings("@mipmap/ic_launcher");
       final settings=InitializationSettings(android: initAndroidetting);
        await notificationsPlugin.initialize(settings);
     }




//////  show notification 
      static Future showNotification({
         var id =0,
          var title,
           var body,
            var payload
          
         

      }) async=>notificationsPlugin.show(id, title, body, await  notificationDetails());




        static Future<void> cancelScheduledNotification(String notificationId) async {
             await notificationsPlugin.cancel(int.parse(notificationId));
  }

      ///// show schedule notification 
      ///
      ///
           static Future showScheduleNotification({
         var id ,
          var title,
           var body,
            var payload,
             required DateTime scheduleTime,
          
         

      }) async=>notificationsPlugin.zonedSchedule(
         
        id, title, body,
         tz.TZDateTime.from(scheduleTime, tz.local),
         await  notificationDetails(),
        payload: payload,
         androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime

        );



       static  notificationDetails()async{

         return  const NotificationDetails(android: AndroidNotificationDetails(
          
          
          'channelId1', 'channelName1',importance: Importance.high,
          //  playSound: true,
          //  sound: RawResourceAndroidNotificationSound('notification.mp3')
           ),
          // iOS:IOSNotificationDetails()
         );
          
       }
  }