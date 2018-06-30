using UnityEditor;
using UnityEngine;
using System.Text.RegularExpressions;
using System.Reflection;

public class uvimrc : EditorWindow
{
    // オブジェクトの共通Openコマンド
    // [MenuItem("KeyRemap/Open &o")]
    // static void KeyRemapOpen()
    // {
    //     foreach (var aObj in Selection.objects)
    //     {
    //         var aObjPath = AssetDatabase.GetAssetPath(aObj);
    //         if (Regex.IsMatch(aObjPath, @"^.*\.unity"))  { EditorApplication.OpenScene(aObjPath); }
    //         if (Regex.IsMatch(aObjPath, @"^.*\.cs"))     { AssetDatabase.OpenAsset(aObj); }
    //         if (Regex.IsMatch(aObjPath, @"^.*\.prefab"))
    //         {
    //             PrefabUtility.InstantiatePrefab(aObj);
    //             CommonExecuteMenuItem("Window/Hierarchy");
    //         }
    //     }
    // }

    // ゲームオブジェクト作成
    [MenuItem("KeyRemap/CreateGameObject #&e")]
    static void KeyRemapCreateGameObject() { CommonExecuteMenuItem("GameObject/Create Empty"); }

    // ゲームオブジェクトの削除
    [MenuItem("KeyRemap/Delete #&d")]
    static void KeyRemapDelete()
    {
        foreach (var aObj in Selection.objects)
        {
            GameObject aGameObject = aObj as GameObject;
            if (aGameObject) { GameObject.DestroyImmediate(aGameObject); }
        }
    }

    // ゲームオブジェクトの有効、無効
    [MenuItem("KeyRemap/ActiveToggle #&t")]
    static void KeyRemapActiveToggle()
    {
        foreach (var aObj in Selection.objects)
        {
            GameObject aGameObject = aObj as GameObject;
            if (aGameObject) { aGameObject.SetActive(!aGameObject.activeSelf); }
        }
    }

    // PrefabのApply
    // [MenuItem("KeyRemap/PrefabApply &a")]
    // static void KeyRemapPrefabApply() { CommonExecuteMenuItem("GameObject/Apply Changes To Prefab"); }

    // コンソール出力のクリア
    [MenuItem("KeyRemap/ClearConsoleLogs #&l")]
    private static void ClearConsoleLogs()
    {
        string typeName = "UnityEditorInternal.LogEntries";
        System.Type type = System.Reflection.Assembly.Load("UnityEditor").GetType(typeName);
        var info = type.GetMethod("Clear", BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance);
        info.Invoke(null, new object[0]);
    }

    // 再インポート
    [MenuItem("KeyRemap/Reimport #&r")]
    static void KeyRemapReimport() { CommonExecuteMenuItem("Assets/Reimport"); }

    // フォーカス変更
    [MenuItem("KeyRemap/Scene #&s")]
    static void KeyRemapScene() { CommonExecuteMenuItem("Window/Scene"); }

    [MenuItem("KeyRemap/Scene #&g")]
    static void KeyRemapGame() { CommonExecuteMenuItem("Window/Game"); }

    [MenuItem("KeyRemap/Inspector #&i")]
    static void KeyRemapInspector() { CommonExecuteMenuItem("Window/Inspector"); }

    [MenuItem("KeyRemap/Hierarchy #&h")]
    static void KeyRemapHierarchy() { CommonExecuteMenuItem("Window/Hierarchy"); }

    [MenuItem("KeyRemap/Project #&p")]
    static void KeyRemapProject() { CommonExecuteMenuItem("Window/Project"); }

    [MenuItem("KeyRemap/Animation #&a")]
    static void KeyRemapAnimation() { CommonExecuteMenuItem("Window/Animation"); }

    [MenuItem("KeyRemap/Console #&c")]
    static void KeyRemapConsole() { CommonExecuteMenuItem("Window/Console"); }

    static void CommonExecuteMenuItem(string iStr)
    {
        EditorApplication.ExecuteMenuItem(iStr);
    }
}

