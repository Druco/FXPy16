/* FXFileDialog.i */

%pythonappend FX::FXFileDialog::FXFileDialog %{
  self.thisown = False
%}
%pythonappend FX::FXPyFileDialog::FXPyFileDialog %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXDIALOGBOX_H
#include "FXDialogBox.h"
#endif

namespace FX {


class FXFileSelector;


/// File selection dialog
class FXFileDialog : public FXDialogBox {
public:

  /// Construct file dialog box
  FXFileDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=500,FXint h=300);

  /// Construct free-floating file dialog box
  FXFileDialog(FXApp* a,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=500,FXint h=300);

  /// Hide this window
  virtual void hide();

  /// Change file name
  void setFilename(const FXString& path);

  /// Return file name, if any
  FXString getFilename() const;

  /// Return empty-string terminated list of selected file names, or NULL if none selected
  FXString* getFilenames() const;

  /// Change file pattern
  void setPattern(const FXString& ptrn);

  /// Return file pattern
  FXString getPattern() const;

  /**
  * Change the list of file patterns shown in the file dialog.
  * Each pattern comprises an optional name, followed by a pattern in
  * parentheses.  The patterns are separated by newlines.
  * For example,
  *
  *  "*\n*.cpp,*.cc\n*.hpp,*.hh,*.h"
  *
  * and
  *
  *  "All Files (*)\nC++ Sources (*.cpp,*.cc)\nC++ Headers (*.hpp,*.hh,*.h)"
  *
  * will set the same three patterns, but the former shows no pattern names.
  */
  void setPatternList(const FXString& patterns);

  /// Return list of patterns
  FXString getPatternList() const;

  /**
  * After setting the list of patterns, this call will
  * initially select pattern n as the active one.
  */
  void setCurrentPattern(FXint n);

  /// Return current pattern number
  FXint getCurrentPattern() const;

  /// Get pattern text for given pattern number
  FXString getPatternText(FXint patno) const;

  /// Change pattern text for pattern number
  void setPatternText(FXint patno,const FXString& text);

  /// Return number of patterns
  FXint getNumPatterns() const;

  /// Allow pattern entry
  void allowPatternEntry(FXbool allow);

  /// Return TRUE if pattern entry is allowed
  FXbool allowPatternEntry() const;

  /// Change directory
  void setDirectory(const FXString& path);

  /// Return directory
  FXString getDirectory() const;

  /// Set the inter-item spacing (in pixels)
  void setItemSpace(FXint s);

  /// Return the inter-item spacing (in pixels)
  FXint getItemSpace() const;

  /// Change file selection mode
  void setSelectMode(FXuint mode);

  /// Return file selection mode
  FXuint getSelectMode() const;

  /// Change wildcard matching mode
  void setMatchMode(FXuint mode);

  /// Return wildcard matching mode
  FXuint getMatchMode() const;

  /// Return TRUE if showing hidden files
  FXbool showHiddenFiles() const;

  /// Show or hide hidden files
  void showHiddenFiles(FXbool showing);

  /// Return TRUE if image preview on
  FXbool showImages() const;

  /// Show or hide preview images
  void showImages(FXbool showing);

  /// Return images preview size
  FXint getImageSize() const;

  /// Change images preview size
  void setImageSize(FXint size);

  /// Show readonly button
  void showReadOnly(FXbool show);

  /// Return TRUE if readonly is shown
  FXbool shownReadOnly() const;

  /// Set initial state of readonly button
  void setReadOnly(FXbool state);

  /// Get readonly state
  FXbool getReadOnly() const;

  /// Change File List style
  void setFileBoxStyle(FXuint style);

  /// Return File List style
  FXuint getFileBoxStyle() const;

  /// Allow or disallow navigation
  void allowNavigation(FXbool navigable);
  
  /// Is navigation allowed?
  FXbool allowNavigation() const;

  /// Open existing filename
  static FXString getOpenFilename(FXWindow* owner,const FXString& caption,const FXString& path,const FXString& patterns="*",FXint initial=0);

  /// Open multiple existing files
  static FXString* getOpenFilenames(FXWindow* owner,const FXString& caption,const FXString& path,const FXString& patterns="*",FXint initial=0);

  /// Save to filename
  static FXString getSaveFilename(FXWindow* owner,const FXString& caption,const FXString& path,const FXString& patterns="*",FXint initial=0);

  /// Open directory name
  static FXString getOpenDirectory(FXWindow* owner,const FXString& caption,const FXString& path);

  /// Save to stream
  virtual void save(FXStream& store) const;

  /// Load from stream
  virtual void load(FXStream& store);

  /// Destructor
  virtual ~FXFileDialog();
  };

class FXPyFileDialog : public FXFileDialog {
    FXDECLARE(FXPyFileDialog)
public:
    FXPyFileDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=500,FXint h=300);
    FXPyFileDialog(FXApp* a,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=500,FXint h=300);
};


}
