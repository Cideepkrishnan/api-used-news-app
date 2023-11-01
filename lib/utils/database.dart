class database {
  static List<Map> explore = [
    {
      "topicimage":
          "https://i.pinimg.com/564x/32/e2/0e/32e20e241e32b6820787deef2fd87c49.jpg",
      "topicname": "Sports"
    },
    {
      "topicimage":
          "https://i.pinimg.com/564x/a8/9c/9c/a89c9c37ef8cd7673c16bfdbb41fbf19.jpg",
      "topicname": "Health"
    },
    {
      "topicimage":
          "https://i.pinimg.com/736x/89/9b/d1/899bd1bd5da8478bd6e040a42dcd75b8.jpg",
      "topicname": "Technology"
    },
    {
      "topicimage":
          "https://i.pinimg.com/564x/0c/22/42/0c2242026e0692425392496d69399857.jpg",
      "topicname": "Bussiness"
    },
    {
      "topicimage":
          "https://i.pinimg.com/564x/02/00/70/020070839ccab9b99df21b71777543df.jpg",
      "topicname": "Science"
    },
    {
      "topicimage":
          "https://i.pinimg.com/564x/e8/7f/ab/e87fabb3290603d2ea5f5a30691a4a8e.jpg",
      "topicname": "General"
    }
  ];

  
  static List<Map> detail = [
    {"title": "Sports", "name": "fetchCategorySports"},
    {"title": "Health", "name": "fetchCategoryHealth"},
    {"title": "Technology", "name": "fetchCategoryTechnology"},
    {"title": "Bussiness", "name": "fetchCategoryBussines"},
    {"title": "Science", "name": "fetchCategoryScience"},
    {"title": "General", "name": "fetchCategoryGeneral"},
  ];
}
