/****** Object:  Table [dbo].[ButtonBarMenuConfig]    Script Date: 10/27/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ButtonBarMenuConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[MenuKey] [nvarchar](50) NULL,
	[IsTabsEnabled] [bit] NULL,
	[Margin] [nvarchar](50) NULL,
	[Padding] [nvarchar](50) NULL,
	[Height] [nvarchar](50) NULL,
	[SelectedBackgroundColor] [nvarchar](50) NULL,
	[SeparatorColor] [nvarchar](50) NULL,
	[SeparatorHeight] [nvarchar](50) NULL,
	[ButtonWidth] [nvarchar](50) NULL,
	[ButtonHeight] [nvarchar](50) NULL,
	[ButtonBackgroundColor] [nvarchar](50) NULL,
	[ButtonBorderRadius] [nvarchar](50) NULL,
	[ButtonFontSize] [nvarchar](50) NULL,
	[ButtonFontFamily] [nvarchar](50) NULL,
	[ButtonFontWeight] [nvarchar](50) NULL,
	[ButtonFontColor] [nvarchar](50) NULL,
	[ButtonImageHeight] [nvarchar](50) NULL,
	[ButtonImageWidth] [nvarchar](50) NULL,
	[ButtonPadding] [nvarchar](50) NULL,
	[ButtonMargin] [nvarchar](50) NULL,
	[ButtonHoverBackgroundColor] [nvarchar](50) NULL,
	[BackgroundColor] [nvarchar](50) NULL,
	[ButtonTextDisplay] [nvarchar](50) NULL,
	[ButtonTextMargin] [nvarchar](50) NULL,
	[Width] [nvarchar](50) NULL,
	[ButtonTextAlign] [nvarchar](50) NULL,
	[ButtonFloat] [nvarchar](50) NULL,
	[ButtonSelectedFontColor] [nvarchar](50) NULL,
	[ButtonSelectedBorder] [nvarchar](50) NULL,
	[ButtonActiveFontColor] [nvarchar](50) NULL,
	[ButtonActiveBackgroundColor] [nvarchar](50) NULL,
	[ButtonActiveBorder] [nvarchar](50) NULL,
	[ButtonHoverFontColor] [nvarchar](50) NULL,
	[ButtonHoverBorder] [nvarchar](50) NULL,
	[ButtonBorder] [nvarchar](50) NULL,
 CONSTRAINT [PK_ButtonBarMenuConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ButtonBarMenuItem]    Script Date: 10/27/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ButtonBarMenuItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ButtonBarMenuConfigID] [int] NULL,
	[ImageSrc] [nvarchar](1024) NULL,
	[Caption] [nvarchar](100) NULL,
	[Link] [nvarchar](2048) NULL,
	[IsNewWindow] [bit] NULL,
	[Ordinal] [int] NULL,
	[MenuItemKey] [nvarchar](50) NULL,
	[IsSeparator] [bit] NULL,
 CONSTRAINT [PK_ButtonBarMenuItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ButtonBarMenuSupport]    Script Date: 10/27/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ButtonBarMenuSupport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StylesCSS] [nvarchar](max) NULL,
	[Scripts] [nvarchar](max) NULL,
 CONSTRAINT [PK_ButtonBarMenuSupport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ButtonBarMenu_Delete]    Script Date: 10/27/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ButtonBarMenu_Delete]
	 @pID int

as

/*** TESITNG

declare  @pID int = 2

exec dbo.[ButtonBarMenu_Delete] @pID


***/


DELETE 
FROM [dbo].[ButtonBarMenuItem]
WHERE ButtonBarMenuConfigID = @pID

DELETE
FROM [dbo].[ButtonBarMenuConfig]
WHERE [ID] = @pID
GO
/****** Object:  StoredProcedure [dbo].[ButtonBarMenuConfig_Clone]    Script Date: 10/27/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ButtonBarMenuConfig_Clone]
	 @pIDtoClone int

as


/*** TESTING

declare @pIDtoClone int = 1

exec dbo.[ButtonBarMenuConfig_Clone] @pIDtoClone

***/


INSERT INTO [dbo].[ButtonBarMenuConfig]
SELECT
       'COPY of ' + [MenuName]
	  ,NULL as [MenuKey]
      ,[IsTabsEnabled]
      ,[Margin]
      ,[Padding]
      ,[Height]
      ,[SelectedBackgroundColor]
      ,[SeparatorColor]
      ,[SeparatorHeight]
      ,[ButtonWidth]
      ,[ButtonHeight]
      ,[ButtonBackgroundColor]
      ,[ButtonBorderRadius]
      ,[ButtonFontSize]
      ,[ButtonFontFamily]
      ,[ButtonFontWeight]
      ,[ButtonFontColor]
      ,[ButtonImageHeight]
      ,[ButtonImageWidth]
      ,[ButtonPadding]
      ,[ButtonMargin]
      ,[ButtonHoverBackgroundColor]
      ,[BackgroundColor]
      ,[ButtonTextDisplay]
      ,[ButtonTextMargin]
      ,[Width]
      ,[ButtonTextAlign]
      ,[ButtonFloat]
      ,[ButtonSelectedFontColor]
      ,[ButtonSelectedBorder]
      ,[ButtonActiveFontColor]
      ,[ButtonActiveBackgroundColor]
      ,[ButtonActiveBorder]
      ,[ButtonHoverFontColor]
      ,[ButtonHoverBorder]
	  ,[ButtonBorder]
FROM [dbo].[ButtonBarMenuConfig]
WHERE [ID] = @pIDtoClone

SELECT @@IDENTITY as [ID]


GO
/****** Object:  StoredProcedure [dbo].[ButtonBarMenuHTML]    Script Date: 10/27/2020 11:27:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ButtonBarMenuHTML]
	 @pMenuKey nvarchar(50)

as

/***  TESTING

declare @pMenuKey nvarchar(50) = 'ButtonBar.Preview'

exec dbo.[ButtonBarMenuHTML] @pMenuKey

***/

-- declare @CRLF nvarchar(1) = CHAR(10)
declare @CRLF nvarchar(1) = ''

declare @HTML nvarchar(max) = ''
declare @CSSVars nvarchar(max)
declare @CSS nvarchar(max)
declare @script nvarchar(max)

declare @menuItemIndex int = 1
declare @elementID nvarchar(50)

-- HTML element template variables
declare @menuItemTemplate nvarchar(max) = N'<div id="{menuItemKey}" class="divButton" title="{menuItemKey}" onclick="buttonBarClick(this, this.id, ''{data-link}'');">{imgElement}<span class="buttonText">{caption}</span></div>'
declare @menuItemSeparator nvarchar(50) = '<div class="separator"></div>'

-- HTML variables
declare @menuItemsHTML nvarchar(max)

-- Menu Configuration variables
declare	 @ConfigID						  int
        ,@Margin 						  nvarchar(50) 
		,@Padding                         nvarchar(50)
		,@Height                          nvarchar(50)
		,@SelectedBackgroundColor         nvarchar(50)
		,@SeparatorColor                  nvarchar(50)
		,@SeparatorHeight                 nvarchar(50)
		,@ButtonWidth                     nvarchar(50)
		,@ButtonHeight                    nvarchar(50)
		,@ButtonBackgroundColor           nvarchar(50)
		,@ButtonBorderRadius              nvarchar(50)
		,@ButtonFontSize                  nvarchar(50)
		,@ButtonFontFamily                nvarchar(50)
		,@ButtonFontWeight                nvarchar(50)
		,@ButtonFontColor                 nvarchar(50)
		,@ButtonImageHeight               nvarchar(50)
		,@ButtonImageWidth                nvarchar(50)
		,@ButtonPadding                   nvarchar(50)
		,@ButtonMargin                    nvarchar(50)
		,@ButtonHoverBackgroundColor      nvarchar(50)
		,@BackgroundColor			      nvarchar(50)
		,@ButtonTextDisplay			      nvarchar(50)
		,@ButtonTextMargin			      nvarchar(50)
		,@Width				              nvarchar(50)
		,@ButtonTextAlign                 nvarchar(50)
		,@ButtonFloat                     nvarchar(50)
		,@IsTabsEnabled			          bit
		,@ButtonSelectedFontColor		  nvarchar(50)	
		,@ButtonSelectedBorder		      nvarchar(50)	
		,@ButtonActiveFontColor			  nvarchar(50)	
		,@ButtonActiveBackgroundColor	  nvarchar(50)	
		,@ButtonActiveBorder			  nvarchar(50)	
		,@ButtonHoverFontColor			  nvarchar(50)	
		,@ButtonHoverBorder				  nvarchar(50)	
		,@ButtonBorder					  nvarchar(50)

-- Menu Item cursor variables
declare @imageSrc nvarchar(1024)
       ,@caption nvarchar(100)
	   ,@link nvarchar(2048)
	   ,@isNewWindow bit
	   ,@MenuItemKey nvarchar(50)
	   ,@IsSeparator bit

-- Load Menu Configuration variables
SELECT 
	 @ConfigID				        = [ID]
	,@Margin 						= Margin 						
	,@Padding                      	= Padding                      
	,@Height                       	= Height                       
	,@SelectedBackgroundColor      	= SelectedBackgroundColor      
	,@SeparatorColor               	= SeparatorColor               
	,@SeparatorHeight              	= SeparatorHeight              
	,@ButtonWidth                  	= ButtonWidth                  
	,@ButtonHeight                 	= ButtonHeight                 
	,@ButtonBackgroundColor        	= ButtonBackgroundColor        
	,@ButtonBorderRadius           	= ButtonBorderRadius           
	,@ButtonFontSize               	= ButtonFontSize               
	,@ButtonFontFamily             	= ButtonFontFamily             
	,@ButtonFontWeight             	= ButtonFontWeight             
	,@ButtonFontColor              	= ButtonFontColor              
	,@ButtonImageHeight            	= ButtonImageHeight            
	,@ButtonImageWidth             	= ButtonImageWidth             
	,@ButtonPadding                	= ButtonPadding                
	,@ButtonMargin                 	= ButtonMargin                 
	,@ButtonHoverBackgroundColor   	= ButtonHoverBackgroundColor   
	,@BackgroundColor         	    = BackgroundColor    
	,@ButtonTextDisplay         	= ButtonTextDisplay    
	,@ButtonTextMargin         	    = ButtonTextMargin  
	,@Width	                        = Width
	,@ButtonTextAlign               = ButtonTextAlign
	,@ButtonFloat                   = ButtonFloat
	,@IsTabsEnabled                 = IsTabsEnabled
	,@ButtonSelectedFontColor		= ButtonSelectedFontColor		  	
	,@ButtonSelectedBorder		    = ButtonSelectedBorder		      	
	,@ButtonActiveFontColor			= ButtonActiveFontColor			  	
	,@ButtonActiveBackgroundColor	= ButtonActiveBackgroundColor	  	
	,@ButtonActiveBorder			= ButtonActiveBorder			  	
	,@ButtonHoverFontColor			= ButtonHoverFontColor			  	
	,@ButtonHoverBorder				= ButtonHoverBorder				  	
	,@ButtonBorder					= ButtonBorder
FROM [dbo].[ButtonBarMenuConfig]
WHERE [MenuKey] = @pMenuKey

-- Set CSS variables based on configuration
SET @CSSVars = N'
<style>

	:root {
		--ButtonBarMargin: ' + @Margin + ';
		--ButtonBarPadding: '+ @Padding + ';
		--ButtonBarHeight: ' + @Height + ';
		--ButtonBarWidth: ' + @Width + ';
		--ButtonBarBackgroundColor: ' + @BackgroundColor + ';

		--ButtonBarSelectedBackgroundColor: ' + @SelectedBackgroundColor + ';
		--ButtonBarSeparatorColor: ' + @SeparatorColor + ';
		--ButtonBarButtonBackgroundColor: ' + @ButtonBackgroundColor + ';
		--ButtonBarButtonFontColor: ' + @ButtonFontColor + ';
		--ButtonBarButtonHoverBackgroundColor: ' + @ButtonHoverBackgroundColor + ';

		--ButtonBarSeparatorHeight: ' + @SeparatorHeight + ';
		--ButtonBarButtonWidth: ' + @ButtonWidth + ';
		--ButtonBarButtonHeight: ' + @ButtonHeight + ';
		--ButtonBarButtonBorderRadius: ' + @ButtonBorderRadius + ';
		--ButtonBarButtonBorder: ' + @ButtonBorder + ';
		--ButtonBarButtonFontSize: ' + @ButtonFontSize + ';
		--ButtonBarButtonFontFamily: ' + @ButtonFontFamily + ';
		--ButtonBarButtonFontWeight: ' + @ButtonFontWeight + ';
		--ButtonBarButtonImageHeight: ' + @ButtonImageHeight + ';
		--ButtonBarButtonImageWidth: ' + @ButtonImageWidth + ';
		--ButtonBarButtonPadding: ' + @ButtonPadding + ';
		--ButtonBarButtonMargin: ' + @ButtonMargin + ';
		--ButtonBarButtonFloat: ' + @ButtonFloat + ';
        --ButtonBarButtonTextAlign: ' + @ButtonTextAlign + ';
		--ButtonBarButtonTextDisplay: '+ @ButtonTextDisplay + ';
		--ButtonBarButtonTextMargin: ' + @ButtonTextMargin + ';

		--ButtonBarSelectedFontColor: ' + @ButtonSelectedFontColor + ';
		--ButtonBarSelectedBorder: ' + @ButtonSelectedBorder + ';	
		--ButtonBarActiveFontColor: ' + @ButtonActiveFontColor + ';
		--ButtonBarActiveBackgroundColor: ' + @ButtonActiveBackgroundColor + ';
		--ButtonBarActiveBorder: ' + 	@ButtonActiveBorder + ';		
		--ButtonBarButtonHoverFontColor: ' + @ButtonHoverFontColor + '; 	
		--ButtonBarButtonHoverBorder: ' + @ButtonHoverBorder + '; 		
	}
</style>
'
-- Get addditional CSS
SELECT @CSS = StylesCSS
FROM [dbo].[ButtonBarMenuSupport]
WHERE ID = 1

print @CSS

SET @CSS = @CSSVars + @CSS

-- Set the script variable
SELECT @script = Scripts
FROM [dbo].[ButtonBarMenuSupport]
WHERE ID = 1

-- Set script replacement tags
IF (@IsTabsEnabled = 1) BEGIN
	SET @script = REPLACE(@script, '{enableTabs}', 'true')
END
ELSE BEGIN
	SET @script = REPLACE(@script, '{enableTabs}', 'false')
END

---------------------
-- MAIN PROCESSING --
---------------------

-- Menu items cursor
DECLARE curMenuItem CURSOR FAST_FORWARD FOR
SELECT ImageSrc, ISNULL(Caption, '') as Caption , ISNULL(Link, '') as Link, IsNewWindow, MenuItemKey, IsSeparator
FROM [dbo].[ButtonBarMenuItem]
WHERE ButtonBarMenuConfigID = @ConfigID 
ORDER BY Ordinal

OPEN curMenuItem

-- Menu items processing
FETCH NEXT FROM curMenuItem
INTO @imageSrc, @caption, @link, @isNewWindow, @MenuItemKey, @IsSeparator
	
SET @menuItemIndex = 1
SET @menuItemsHTML = ''

WHILE @@FETCH_STATUS = 0
BEGIN
	
	IF (@IsSeparator = 1) BEGIN
		SET @menuItemsHTML = @menuItemsHTML + @menuItemSeparator 
	END
	ELSE BEGIN

		SET @menuItemsHTML = @menuItemsHTML + @menuItemTemplate

		SET @menuItemsHTML = REPLACE(@menuItemsHTML, '{menuItemKey}', @MenuItemKey)
		SET @menuItemsHTML = REPLACE(@menuItemsHTML, '{caption}', @caption)

		IF (ISNULL(@imageSrc, '') <> '') BEGIN
			SET @menuItemsHTML = REPLACE(@menuItemsHTML, '{imgElement}', '<img src="' + @imageSrc + '">')
		END
		ELSE BEGIN
			SET @menuItemsHTML = REPLACE(@menuItemsHTML, '{imgElement}', '')
		END

		IF (ISNULL(@link, '') <> '') BEGIN
			SET @menuItemsHTML = REPLACE(@menuItemsHTML, '{data-link}', @link)
		END
		ELSE BEGIN
			SET @menuItemsHTML = REPLACE(@menuItemsHTML, '{data-link}', '')
		END
	END

	FETCH NEXT FROM curMenuItem
	INTO @imageSrc, @caption, @link, @isNewWindow, @MenuItemKey, @IsSeparator

	SET @menuItemsHTML = @menuItemsHTML + @CRLF

	SET @menuItemIndex = @menuItemIndex + 1

END

CLOSE curMenuItem
DEALLOCATE curMenuItem
	
-- Set and return the FINAL HTML
SET @HTML = @CSS + '<div class="divButtonBar">' + @CRLF + @menuItemsHTML + '</div>' + @CRLF + @script
-- SET @HTML = @CSS + + @CRLF + @menuItemsHTML + @CRLF + @script

-- K2 requires a table to be selected for output
DECLARE @tblHTML TABLE (
	HTML nvarchar(max)
)

INSERT INTO @tblHTML
SELECT @HTML

print @HTML

SELECT HTML FROM @tblHTML

GO
