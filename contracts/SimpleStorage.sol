contract SimpleStorage {
  bytes32 public data;

  function setData(bytes32 _data) {
    data = _data;
  }
}
