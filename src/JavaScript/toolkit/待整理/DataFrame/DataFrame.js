/**
 * @module DataFrame
 * @file DataFrame 类
 */


class DataFrame {

  constructor(array) {
    this._data = array;
    this._length = this._data.length;
    this._colNames = Object.keys(this._data[0]);
  }

  length() {
    return this._length;
  }

  colNames(newNames) {
    if (arguments.length === 0) {
      return this._colNames;
    } else {
      for (let i = 0; i < newNames.length; i++) {
        const oldName = this._colNames[i];
        const newName = newNames[i];
        const re = new RegExp(`"${oldName}":`, "g");
        this._data = JSON.parse(JSON.stringify(this._data).replace(re, `"${newName}":`));
      }
      this._colNames = Object.keys(this._data[0]);
      return this;
    }
  }

  rename(oldName, newName) {
    const re = new RegExp(`"${oldName}":`, "g");
    this._data = JSON.parse(JSON.stringify(this._data).replace(re, `"${newName}":`));
    this._colNames = Object.keys(this._data[0]);
    return this;
  }

  /** 查看前n行，拷贝了一个新数据框
   * @param  {} n
   */
  head(n) {
    return new DataFrame(this._data.slice(0, n));
  }


  tail(n) {
    return new DataFrame(this._data.reverse().slice(0, n));
  }

  print() {
    console.log(this._data);
  }
}



class DataTable {

  constructor(list) {
    this._data = list;
    this._colNames = Object.keys(list);

    const nColumn = Object.keys(list).length;
    const nRow = list[Object.keys(list)[0]].length;
    this._size = {
      nRow: nRow,
      nColumn: nColumn
    };
  }

  size() {
    return this._size;
  }

  colNames(newNames) {
    if (arguments.length === 0) {
      return this._colNames;
    } else {
      const newObject = {};
      for (let i = 0; i < newNames.length; i++) {
        newObject[newNames[i]] = Object.values(this._data)[i];
      }
      this._data = newObject;
      return this;
    }
  }

  rename(oldName, newName) {
    // 对象属性的排序是个大问题
  }

  head(n) {
    let newObject = {};
    Object.keys(this._data).forEach(key => {
      newObject[key] = this._data[key].slice(0, n);
    });
    return new DataTable(newObject);
  }

  tail(n) {
    const newObject = {};
    Object.keys(this._data).forEach(key => {
      newObject[key] = this._data[key].reverse().slice(0, n);
    });
    return new DataTable(newObject);
  }

  print() {
    console.log(this._data);
  }

}





export { DataFrame, DataTable };

