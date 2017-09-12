/*
 * This file is auto-generated.  DO NOT MODIFY.
 * Original file: /home/alex/Android/eclipse/sdk/AlexRemoteCallService/src/com/alex/ticketmanager/ITicketManager.aidl
 */
package com.alex.ticketmanager;
public interface ITicketManager extends android.os.IInterface
{
/** Local-side IPC implementation stub class. */
public static abstract class Stub extends android.os.Binder implements com.alex.ticketmanager.ITicketManager
{
private static final java.lang.String DESCRIPTOR = "com.alex.ticketmanager.ITicketManager";
/** Construct the stub at attach it to the interface. */
public Stub()
{
this.attachInterface(this, DESCRIPTOR);
}
/**
 * Cast an IBinder object into an com.alex.ticketmanager.ITicketManager interface,
 * generating a proxy if needed.
 */
public static com.alex.ticketmanager.ITicketManager asInterface(android.os.IBinder obj)
{
if ((obj==null)) {
return null;
}
android.os.IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
if (((iin!=null)&&(iin instanceof com.alex.ticketmanager.ITicketManager))) {
return ((com.alex.ticketmanager.ITicketManager)iin);
}
return new com.alex.ticketmanager.ITicketManager.Stub.Proxy(obj);
}
@Override public android.os.IBinder asBinder()
{
return this;
}
@Override public boolean onTransact(int code, android.os.Parcel data, android.os.Parcel reply, int flags) throws android.os.RemoteException
{
switch (code)
{
case INTERFACE_TRANSACTION:
{
reply.writeString(DESCRIPTOR);
return true;
}
case TRANSACTION_buy:
{
data.enforceInterface(DESCRIPTOR);
int _arg0;
_arg0 = data.readInt();
java.lang.String _arg1;
_arg1 = data.readString();
java.lang.String _arg2;
_arg2 = data.readString();
boolean _result = this.buy(_arg0, _arg1, _arg2);
reply.writeNoException();
reply.writeInt(((_result)?(1):(0)));
return true;
}
}
return super.onTransact(code, data, reply, flags);
}
private static class Proxy implements com.alex.ticketmanager.ITicketManager
{
private android.os.IBinder mRemote;
Proxy(android.os.IBinder remote)
{
mRemote = remote;
}
@Override public android.os.IBinder asBinder()
{
return mRemote;
}
public java.lang.String getInterfaceDescriptor()
{
return DESCRIPTOR;
}
@Override public boolean buy(int number, java.lang.String departureStation, java.lang.String terminus) throws android.os.RemoteException
{
android.os.Parcel _data = android.os.Parcel.obtain();
android.os.Parcel _reply = android.os.Parcel.obtain();
boolean _result;
try {
_data.writeInterfaceToken(DESCRIPTOR);
_data.writeInt(number);
_data.writeString(departureStation);
_data.writeString(terminus);
mRemote.transact(Stub.TRANSACTION_buy, _data, _reply, 0);
_reply.readException();
_result = (0!=_reply.readInt());
}
finally {
_reply.recycle();
_data.recycle();
}
return _result;
}
}
static final int TRANSACTION_buy = (android.os.IBinder.FIRST_CALL_TRANSACTION + 0);
}
public boolean buy(int number, java.lang.String departureStation, java.lang.String terminus) throws android.os.RemoteException;
}
