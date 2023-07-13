using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace The.Clienys.Toast.RNTheClienysToast
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNTheClienysToastModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNTheClienysToastModule"/>.
        /// </summary>
        internal RNTheClienysToastModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNTheClienysToast";
            }
        }
    }
}
