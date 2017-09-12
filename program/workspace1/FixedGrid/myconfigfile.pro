-injars     temp.jar
-outjars     obfuscated.jar
-libraryjars C:\android-sdk-windows-1.6_r1\platforms\android-1.6\android.jar
-overloadaggressively
-repackageclasses ''
-allowaccessmodification
-optimizations !code/simplification/arithmetic
-printseeds

-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(...);
}
