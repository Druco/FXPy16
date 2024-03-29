/* FXProgressDialog.i */

%pythonappend FX::FXProgressDialog::FXProgressDialog %{
  self.thisown = False
%}
%pythonappend FX::FXPyProgressDialog::FXPyProgressDialog %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXDIALOGBOX_H
#include "FXDialogBox.h"
#endif

namespace FX {


enum {
  PROGRESSDIALOG_NOCANCEL = 0,                        /// Default is no cancel button
  PROGRESSDIALOG_CANCEL   = 0x01000000,               /// Enable the cancel button
  PROGRESSDIALOG_NORMAL   = (DECOR_TITLE|DECOR_BORDER)
  };


class FXHorizontalSeparator;
class FXProgressBar;
class FXButton;
class FXLabel;

/**
* A Progress Dialog is a simple dialog which is used to
* keep a user informed of the progress of a lengthy operation
* in a program and that the program is in fact still working.
*/
class FXProgressDialog : public FXDialogBox {
public:
  long onCmdSetValue(FXObject*,FXSelector,void*);
  long onCmdSetIntValue(FXObject*,FXSelector,void*);
  long onCmdGetIntValue(FXObject*,FXSelector,void*);
  long onCmdSetStringValue(FXObject*,FXSelector,void*);
  long onCmdGetStringValue(FXObject*,FXSelector,void*);
  long onCmdCancel(FXObject*,FXSelector,void*);
public:

  /// Construct input dialog box with given caption, icon, and prompt text
  FXProgressDialog(FXWindow* owner,const FXString& caption,const FXString& label,FXuint opts=PROGRESSDIALOG_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

  /// Change the progress message
  void setMessage(const FXString& msg);

  /// Get progress message
  FXString getMessage() const;

  /// Change style of the progress bar widget
  void setBarStyle(FXuint style);

  /// Get style of the progress bar widget
  FXuint getBarStyle() const;

  /// Change the amount of progress
  void setProgress(FXuint value);

  /// Get current progress
  FXuint getProgress() const;

  /// Set total amount of progress
  void setTotal(FXuint value);

  /// Return total amount of progrss
  FXuint getTotal() const;

  /// Increment progress by given amount
  void increment(FXuint value);

  /// Has operation been cancelled?
  FXbool isCancelled() const { return cancelled; }

  /// Change cancelled flag
  void setCancelled(FXbool flg){ cancelled=flg; }

  /// Destroy
  virtual ~FXProgressDialog();
  };

class FXPyProgressDialog : public FXProgressDialog {
    FXDECLARE(FXPyProgressDialog)
public:
    FXPyProgressDialog(FXWindow* owner,const FXString& caption,const FXString& label,FXuint opts=PROGRESSDIALOG_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
